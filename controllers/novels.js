const models = require('../models')

const getAllNovels = async (request, response) => {
  try {
    const novels = await models.novels.findAll({
      include: [{ model: models.authors }, { model: models.genres }]
    })

    return novels ? response.send(novels) : response.status(500)
  } catch (error) {
    return response.status(500).send('Not able to retrieve novels, please try agin')
  }
}

const getNovelsById = async (request, response) => {
  try {
    const { id } = request.params

    const foundNovel = await models.novels.findOne({
      where: { id },
      include: [{ model: models.authors }, { model: models.genres }]
    })

    return foundNovel
      ? response.send(foundNovel)
      : response.sendStatus(404)
  } catch (error) {
    return response.status(500).send('Not able to retrieve novels, please try agin')
  }
}

module.exports = { getAllNovels, getNovelsById }
