const prisma = require('../config/db')

// need services for creating user (sign up) with email (str) and password (str)

const signup = async (email, password) => {
    const user = await prisma.user.create({
        data: {
            email,
            password
        }
    })
    return user;
}

// need services for logging in

const login = async (email, password) => {
    const user = await prisma.user.findUnique({
        data: {
            email,
            password
        }
    })
    return user;
}


module.exports = {
    signup,
    login
}