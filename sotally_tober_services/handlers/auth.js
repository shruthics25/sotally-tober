const { user } = require('../models/user')
const { unauthorizedResponse, conflictResponse } = require('./response')
const jwt = require('jsonwebtoken')

const login = async (request, h) => {
  const { payload } = request.body
  const loggedInUser = user.findOne({ email: payload.email, password: payload.password })
  let response = unauthorizedResponse
  if (loggedInUser) {
    response = { token: jwt.sign({ email: payload.email }, 'cartFuLL9876') }
  }
  return response
}

const register = async (request, h) => {
  const { payload } = request.body
  let response
  try {
    response = user.create(payload)
  } catch (error) {
    response = conflictResponse
  }
  return response
}

module.exports = { login, register }
