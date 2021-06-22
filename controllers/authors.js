const models = require('../models')

const getAllAuthors = async (request, response) => {
  // eslint-disable-next-line max-len
  const authors = await models.authors.findAll({ attributes: ['id', 'nameFirst', 'nameLast', 'createdAt', 'updatedAt'] })

  return response.send(authors)
}

const getAuthorsById = async (request, response) => {
  const { id } = request.params

  const author = await models.authors.findOne({
    where: {
      [models.Sequelize.Op.or]: [
        { id: id },
        { nameLast: { [models.Sequelize.Op.like]: `%${id}%` } },
        { nameFirst: { [models.Sequelize.Op.like]: `%${id}%` } },
      ]
    },
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
