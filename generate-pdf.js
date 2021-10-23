const { createReadStream, createWriteStream } = require("fs");
const { join } = require("path");
const latex = require("node-latex");

const input = createReadStream(join(__dirname, "./documentLaTex/doc.tex"));
const output = createWriteStream(
  join(__dirname, "./documentLaTex/document.pdf")
);

const options = {
  errorLogs: join(__dirname, "latexerrors.log"), // This will write the errors to `latexerrors.log`
};

latex(input, options).pipe(output);
