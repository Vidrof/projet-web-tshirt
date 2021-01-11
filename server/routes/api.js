const express = require('express')
const router = express.Router()
const bcrypt = require('bcrypt')
const { Client } = require('pg')

const client = new Client({
 user: 'postgres',
 host: 'localhost',
 password: '123',
 database: 'tshirt_time'
})

client.connect()

router.delete('/me', async (req, res) => {
  if (typeof req.session.userId === 'undefined') {
    res.send('non connecté')
    return
  }

  delete req.session.userId

  res.send('ok')
})
router.get('/me', async (req, res) => {
  if (typeof req.session.userId === 'undefined') {
    res.status(401).json({ message: 'not connected' })
    return
  }

  const result = await client.query({
    text: 'SELECT id_user, email FROM users WHERE id_user=$1',
    values: [req.session.userId]
  })

  res.json(result.rows[0])
})
//se connecter
router.post('/login', async (req, res) => {
  const email = req.body.email
  const password = req.body.password

  const result = await client.query({
    text: 'SELECT * FROM users WHERE email=$1',
    values: [email]
  })

  if (result.rows.length === 0) {
    res.status(401).json({
      message: 'user doesnt exist'
    })
    return
  }

  const user = result.rows[0]

  if (await bcrypt.compare(password, user.password)) {
    // alors connecter l'utilisateur
    req.session.userId = user.id_user
    res.json({
      id: user.id,
      pseudo: user.pseudo,
      email: user.email,
      description: user.description
    })
  } else {
    res.status(401).json({
      message: 'bad password'
    })
    return
  }
})

//changer sa description
router.post('/login', async (req, res) => {
  const email = req.body.email
  const password = req.body.password

  const result = await client.query({
    text: 'SELECT * FROM users WHERE email=$1',
    values: [email]
  })

  if (result.rows.length === 0) {
    res.status(401).json({
      message: 'user doesnt exist'
    })
    return
  }

  const user = result.rows[0]

  if (await bcrypt.compare(password, user.password)) {
    // alors connecter l'utilisateur
    req.session.userId = user.id_user
    res.json({
      id: user.id_user,
      pseudo: user.pseudo,
      email: user.email,
      description: user.description
    })
  } else {
    res.status(401).json({
      message: 'bad password'
    })
    return
  }
})
//s'enregistrer
router.post('/register', async (req, res) => {
  const email = req.body.email
  const password = req.body.password
  const pseudo = req.body.pseudo

  const result = await client.query({
    text: 'SELECT * FROM users WHERE email=$1',
    values: [email]
  })

  if (result.rows.length > 0) {
    res.status(401).json({
      message: 'user already exists'
    })
    return
  }
  // si on a pas trouvé l'utilisateur
  // alors on le crée
  const hash = await bcrypt.hash(password, 10)

  await client.query({
    text: `INSERT INTO users(email, password, pseudo)
    VALUES ($1, $2, $3)
    `,
    values: [email, hash, pseudo]
  })
  res.send('ok')
})

//recupérer tous les tshirts
router.get('/tshirt', async(req, res) => {
  const result = await client.query({
    text: 'SELECT * from tshirt'
  })

  if(result.rows.length <= 0){
    res.status(401).json({
      message: 'no tshirt available'
    })
    return
  }

  res.send(result.rows)
})

router.get('/tshirt/:id_tshirt', async(req, res) => {
  const id_tshirt = req.params.id_tshirt

  const result = await client.query({
    text : 'SELECT * from tshirt WHERE id_tshirt=$1',
    values: [id_tshirt]
  })

  if(result.rows.length <= 0){
    res.status(401).json({
      message: 'no tshirt with this id'
    })
    return
  }

  res.send(result.rows[0])
})
//récuperer les tshirt lié à un user
router.get('/tshirt/user/:id_user', async(req, res) => {
  const id_user = req.params.id_user

  const result = await client.query({
    text : 'SELECT * from tshirt WHERE id_user=$1',
    values: [id_user]
  })

  if(result.rows.length <= 0){
    res.status(401).json({
      message: 'this user do not have any tshirt'
    })
    return
  }

  res.send(result.rows)
})
//récupérer les couleurs d'un tshirt
router.get('/couleur/tshirt/:id_tshirt', async(req, res) => {
  const id_tshirt = req.params.id_tshirt

  const result = await client.query({
    text : `SELECT * FROM couleur_tshirt
    JOIN couleurs
    ON couleur_tshirt.id_couleur = couleurs.id_couleur
    WHERE id_tshirt = $1`,
    values: [id_tshirt]
  })

  if(result.rows.length <= 0){
    res.status(401).json({
      message: 'this user do not have any tshirt'
    })
    return
  }

  res.send(result.rows)
})

// poster un avis
router.post('/avis', async (req, res) => {
  const note = req.body.note
  const contenu = req.body.contenu
  const titre = req.body.titre
  const id_tshirt = req.body.id_tshirt

  const id_user = req.session.userId

  if(typeof id_user === 'undefined'){
    res.status(401).json({
      message: 'you are not connected'
    })
    return
  }

  if(typeof note === 'undefined'
    || typeof contenu === 'undefined'
    || typeof titre === 'undefined'
    || typeof id_tshirt === 'undefined'){
    res.status(401).json({
      message: 'tshirt incomplete'
    })
    return
  }

  await client.query({
    text: `INSERT INTO avis(note, contenu, titre, id_user, id_tshirt)
    VALUES ($1, $2, $3, $4, $5)
    `,
    values: [note, contenu, titre, id_user, id_tshirt]
  })
  
  res.send('ok')
})

//recupérer les avis d'un tshirt
router.get('/avis/tshirt/:id_tshirt', async(req, res) => {
  const id_tshirt = req.params.id_tshirt

  const result = await client.query({
    text : 'SELECT * from avis WHERE id_tshirt=$1',
    values: [id_tshirt]
  })

  if(result.rows.length <= 0){
    res.status(401).json({
      message: 'this tshirt do not have any avis'
    })
    return
  }

  res.send(result.rows)
})

//recupérer les avis posté par un user
router.get('/avis/user/:id_user', async(req, res) => {
  const id_user = req.params.id_user

  const result = await client.query({
    text : 'SELECT * from avis WHERE id_user=$1',
    values: [id_user]
  })

  if(result.rows.length <= 0){
    res.status(401).json({
      message: 'this user hasn\'t post any avis'
    })
    return
  }

  res.send(result.rows)
})

router.get('/types', async(req, res) => {
  const result = await client.query({
    text: 'SELECT * from types'
  })

  if(result.rows.length <= 0){
    res.status(401).json({
      message: 'no types available'
    })
    return
  }

  res.send(result.rows)
})

router.get('/types/:id_type', async(req, res) => {
  const id_type = req.params.id_type

  const result = await client.query({
    text : 'SELECT * from types WHERE id_type=$1',
    values: [id_type]
  })

  if(result.rows.length <= 0){
    res.status(401).json({
      message: 'no type with this id'
    })
    return
  }

  res.send(result.rows[0])
})

router.get('/couleurs', async(req, res) => {
  const result = await client.query({
    text: 'SELECT * from couleurs'
  })

  if(result.rows.length <= 0){
    res.status(401).json({
      message: 'no couleurs available'
    })
    return
  }

  res.send(result.rows)
})

router.post('/tshirt', async (req, res) => {
  if (typeof req.session.userId === 'undefined') {
    res.status(401).json({ message: 'not connected' })
    return
  }

  const description = req.body.description
  const titre = req.body.titre
  const id_type = parseInt(req.body.id_type)
  const id_user = req.session.userId
  const couleurs = req.body.couleurs

  if(typeof description !== "string"
  || typeof titre !== "string"
  || typeof id_type !== "number"
  || typeof couleurs !== "object"){
    res.status(401).json({ message: error })
    return
  }

  await client.query({
    text: `INSERT INTO tshirt (description, titre, id_type, id_user)
    VALUES ($1, $2, $3, $4)`,
    values: [description, titre, id_type, id_user]
  })

  const result = await client.query({
    text: 'SELECT LASTVAL()'
  })
  const id_tshirt = result.rows[0].lastval;
  var i = 0;
  for(i=0; i<couleurs.length ; i++){
    var id_couleur = couleurs[i]
    const result2 = await client.query({
      text: 'SELECT * FROM couleurs WHERE id_couleur = $1',
      values: [id_couleur]
    })

    if(result.rows.length <= 0){
      res.status(401).json({
        message: 'no couleurs with this id'
      })
      return
    }

    await client.query({
      text: `INSERT INTO couleur_tshirt (id_tshirt, id_couleur)
      VALUES ($1, $2)`,
      values: [id_tshirt, id_couleur]
    })
  }

  res.send('ok')
})

router.get('/users/:id_user', async(req, res) => {
  const id_user = req.params.id_user

  const result = await client.query({
    text : 'SELECT * from users WHERE id_user=$1',
    values: [id_user]
  })

  if(result.rows.length <= 0){
    res.status(401).json({
      message: 'this user does not exist'
    })
    return
  }

  res.send(result.rows[0])
})

module.exports = router
