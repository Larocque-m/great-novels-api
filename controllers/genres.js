const models = require('../models')

const getAllGenres = async (request, response) => {
  try {
    const genres = await models.genres.findAll({ attributes: ['id', 'name', 'createdAt', 'updatedAt'] })

    return genres ? response.send(genres) : response.status(500)
  } catch (error) {
    return response.status(500).send('Not able to retrieve genres, please try agin')
  }
}

const getGenresById = async (request, response) => {
  try {
    const { id } = request.params

    const foundGenre = await models.genres.findOne({
      where: { id },
      include: [{
        model: models.novels,
        include: [{ model: models.authors }]
      }]
    })

    return foundGenre
      ? response.send(foundGenre)
      : response.sendStatus(404)
  } catch (error) {
    return response.status(500).send('Not able to retrieve genres, please try agin')
  }
}

module.exports = { getAllGenres, getGenresById }
