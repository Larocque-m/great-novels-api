const novels = (connection, Sequelize, authors) => {
  return connection.define('novels', {
    id: { type: Sequelize.INTEGER, autoIncrement: true, primaryKey: true },
    authorId: { type: Sequelize.INTEGER, references: { model: authors, key: 'id' } },
    title: { type: Sequelize.STRING, allowNull: false },
  }, { paranoid: true })
}

module.exports = novels
