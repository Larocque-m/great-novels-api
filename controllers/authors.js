const models = require('../models')

const getAllAuthors = async (request, response) => {
  const authors = await models.authors.findAll({ attributes: ['id', 'nameFirst', 'nameLast', 'createdAt', 'updatedAt'] })

  return response.send(authors)
}

const getAuthorsById = async (request, response) => {
  const { id } = request.params

  const author = await models.authors.findOne({
    where: { id },
    include: [{
      model: models.novels,
      include: [{ model: models.genres }]
    }]
  })

  return author
    ? response.send(author)
    : response.sendStatus(404)
}

module.exports = { getAllAuthors, getAuthorsById }
