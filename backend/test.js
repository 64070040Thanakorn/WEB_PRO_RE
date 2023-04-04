const jwt = require("jsonwebtoken");



async function test() { //

  const accessToken = jwt.sign({ sub: "user.id" }, "fdasfdsafdasfdasvczx");
  const test = jwt.verify(accessToken, "fdasfdsafdasfdasvczx");

  console.log(accessToken);
  console.log(test);
}


test();