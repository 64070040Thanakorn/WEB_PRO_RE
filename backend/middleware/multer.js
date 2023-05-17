import multer from 'multer'
import path from 'path'

var storage = multer.diskStorage({
    destination: function (req, file, callback) {
        callback(null, './static/uploads')
    },
    filename: function (req, file, callback) {
        callback(null, file.fieldname + '-' + Date.now() + path.extname(file.originalname))
    }
})

const setMulter = multer({ storage: storage })
export default setMulter