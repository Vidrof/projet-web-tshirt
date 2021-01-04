const express = require('express')
const router = express.Router()


/*
class Objet {
  constructor () {
    this.createdAt = new Date()
    this.updatedAt = new Date()
    this.array = []
  }
}

router.use((req, res, next) => {
  // l'utilisateur n'est pas reconnu
  if (typeof req.session.objet === 'undefined') {
    req.session.objet = new Objet()
  }
  next()
})


router.get('/panier', (req, res) => {
  res.json(req.session.panier)
})

router.post('/panier', (req, res) => {
  req.body.articleId

  if (isNaN(quantity)) {
    res.status(400).json({ message: "You cannot add a quantity of 0 in your cart"})
    return
  }

  const newArticle = {
    id: articleId,
    quantity
  }

  res.send(newArticle)
})

router.put('/panier/:articleId', (req, res) => {
  const articleId = parseInt(req.params.articleId)

  if (isNaN(quantity) || quantity <= 0) {
    res.status(400).json({ message: "You cannot add a quantity of 0 in your cart"})
    return
  }

  res.send()
})

router.route('/article/:articleId')
  .get(parseArticle, (req, res) => {
  })
  .put(parseArticle, (req, res) => {
    const name = req.body.name
    const description = req.body.description
    const image = req.body.image
    const price = parseInt(req.body.price)

    req.article.name = name
    req.article.description = description
    req.article.image = image
    req.article.price = price
    res.send()
  })

  .delete(parseArticle, (req, res) => {
    const index = articles.findIndex(a => a.id === req.articleId)

    articles.splice(index, 1) // remove the article from the array
    res.send()
  })
*/
module.exports = router
