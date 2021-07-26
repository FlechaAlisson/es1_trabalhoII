import axios from 'axios'

const conn = axios.create({
    baseURL: 'http://localhost:3000',
    headers: {
      // eslint-disable-next-line
      'Accept': 'application/json',
      'Content-type': 'application/json',
    },
  })

  export {conn};