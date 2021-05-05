const express = require("express");
const _ = require("lodash");

const app = express();
const components = [];

app.get("/", function (req, res) {
  res.json(components);
});

app.get("/app/:id", function (req, res) {
  let component = _.find(components, { id: req.params.id });
  if (!component) {
    component = { id: req.params.id, date: new Date() };
    components.push(component);
    console.log(`Component registered: ${component.id}`);
  } else {
    component.date = new Date();
  }
  res.json(component);
});

setInterval(() => {
  for (let i = 0; i < components.length; i++) {
    component = components[components.length - i - 1];
    if (new Date() - component.date > 20000) {
      console.log(`Component unregistered: ${component.id}`);
      components.splice(components.length - i - 1, 1);
    }
  }
}, 1000);

const server = app.listen(3000, function () {
  console.log("App listening at http://%s:%s", server.address().address, server.address().port);
});
