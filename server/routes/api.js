const express = require('express')
const router = express.Router()


//route pour se connecter
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
    req.session.userId = user.id
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
