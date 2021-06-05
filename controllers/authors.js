const models = require('../models')

const getAllAuthors = async (request, response) => {
  try {
    const authors = await models.authors.findAll({
      attributes: ['id', 'nameFirst', 'nameLast', 'createdAt', 'updatedAt']
    })

    return authors ? response.send(authors) : response.status(500)
  } catch (error) {
    return response.status(500).send('Not able to retrieve authors, please try agin')
  }
}

const getAuthorsById = async (request, response) => {
  try {
    const { id } = request.params

    const foundAuthor = await models.authors.findOne({
      attributes: ['id', 'nameFirst', 'nameLast', 'createdAt', 'updatedAt'],
      where: { id },
      include: [{
        model: models.novels,
        attributes: ['id', 'title', 'authorId', 'createdAt', 'updatedAt'],
        include: [{
          model: models.genres,
          attributes: ['id', 'name', 'createdAt', 'updatedAt']
        }]
      }]
    })

    return foundAuthor
      ? response.send(foundAuthor)
      : response.sendStatus(404)
  } catch (error) {
    return response.status(500).send('Not able to retrieve author, please try agian')
  }
}

module.exports = { getAllAuthors, getAuthorsById }
