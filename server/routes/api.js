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

// poster un tshirt
router.post('/tshirt', async (req, res) => {
  const description = req.body.description
  const id_user = req.session.id_user
  const image = req.body.image
  const titre = req.body.titre

  if(typeof id_user === 'undefined'){
    res.status(401).json({
      message: 'you are not connected'
    })
    return
  }

  if(typeof description === 'undefined'
    || typeof image === 'undefined'
    || typeof titre === 'undefined'){
    res.status(401).json({
      message: 'tshirt incomplete'
    })
    return
  }

  await client.query({
    text: `INSERT INTO tshirt(description, id_user, image, titre)
    VALUES ($1, $2, $3, $4)
    `,
    values: [description, id_user, image, titre]
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

router.get('tshirt/:id_tshirt', async(req, res) => {
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
router.get('tshirt/:id_user', async(req, res) => {
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

// poster un avis
router.post('/avis', async (req, res) => {
  const note = req.body.note
  const contenu = req.body.contenu
  const titre = req.body.titre
  const id_tshirt = req.body.id_tshirt

  const id_user = req.session.id_user

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
    text: `INSERT INTO tshirt(note, contenu, titre, id_user, id_tshirt)
    VALUES ($1, $2, $3, $4, $5)
    `,
    values: [note, contenu, titre, id_user, id_tshirt]
  })
  
  res.send('ok')
})

//recupérer les avis d'un tshirt
router.get('avis/:id_tshirt', async(req, res) => {
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
router.get('avis/:id_user', async(req, res) => {
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
module.exports = router
