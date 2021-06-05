const novelGenres = (connection, Sequelize, genres, novels) => {
  return connection.define('novelGenres', {
    genreId: { type: Sequelize.INTEGER, primarykey: true, references: { model: genres, key: 'id' } },
    novelId: { type: Sequelize.INTEGER, primarykey: true, references: { model: novels, key: 'id' } },
  }, { defaultScope: { attributes: { exclude: ['deletedAt'] } } }, { paranoid: true })
}

module.exports = novelGenres
