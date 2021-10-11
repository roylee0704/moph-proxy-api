const express = require("express");
const { createProxyMiddleware } = require("http-proxy-middleware");

const app = express();

app.use(
  "/",
  createProxyMiddleware({
    target: "https://cvp1.moph.go.th",
    changeOrigin: true,
    secure: false,
  })
);
app.listen(5000);
