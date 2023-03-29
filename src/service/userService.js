import axios from "axios"

const url = "http://localhost:3000/api/user"

class userService {
  static async getUser(){
    return await axios.get(url)
  }
}

export default userService