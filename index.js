const express = require('express')
const { getAllAuthors, getAuthorsById } = require('./controllers/authors')
const { getAllGenres, getGenresById } = require('./controllers/genres')
const { getAllNovels, getNovelsById } = require('./controllers/novels')

const app = express()

app.get('/authors', getAllAuthors)

app.get('/authors/:id', getAuthorsById)

app.get('/genres', getAllGenres)

app.get('/genres/:id', getGenresById)

app.get('/novels', getAllNovels)

app.get('/novels/:id', getNovelsById)

app.listen(1350, () => {
  console.log('Listening on port 1350...') // eslint-disable-line no-console
})
