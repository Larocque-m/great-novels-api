const models = require('../models')

const getAllGenres = async (request, response) => {
  const genres = await models.genres.findAll({ attributes: ['id', 'name', 'createdAt', 'updatedAt'] })

  return response.send(genres)
}

const getGenresById = async (request, response) => {
  const { id } = request.params

  const genre = await models.genres.findOne({
    where: {
      [models.Op.or]: [
        { id: id },
        { name: { [models.Sequelize.Op.like]: `%${id}%` } },
      ],
    },
    include: [{
      model: models.novels,
      include: [{ model: models.authors }]
    }]
  })

  return genre
    ? response.send(genre)
    : response.sendStatus(404)
}

module.exports = { getAllGenres, getGenresById }
