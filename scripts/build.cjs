#!/usr/bin/env node
const os = require('os');
const fs = require('fs');
const {resolve} = require('path');
const {Readable} = require('stream');
const {spawnSync} = require('child_process');

const tar = require('tar');

const wd = resolve(__dirname, "..")
const version = JSON.parse(fs.readFileSync(resolve(wd, "package.json"))).version;
const cwd = resolve(wd, `xmake-${version}`)
const file = `${cwd}.tar.gz`
const url = `https://github.com/xmake-io/xmake/releases/download/v${version}/xmake-v${version}.tar.gz`;
const prefix = resolve(wd, `prebuilds/xmake-${os.platform()}-${os.arch()}`);

async function download(url, file) {
  const response = await fetch(url);
  if (!response.ok) {
    throw new Error(`fail ${response.status}`);
  }
  const stream = fs.createWriteStream(file);
  Readable.fromWeb(response.body).pipe(stream);

  return new Promise((resolve, reject) => {
    stream.on('finish', resolve);
    stream.on('error', reject);
  });
}

function run(...args) {
  const cmd = spawnSync(...args);
  console.log(cmd.stdout.toString())
  console.error(cmd.stderr.toString())
}

(async () => {
  if (!fs.existsSync(file))
    await download(url, file)
  if (!fs.existsSync(cwd))
    await tar.x({file: file, C: '.'})
  if (!fs.existsSync(resolve(cwd, 'makefile')))
    run("sh", ['configure', `--prefix=${prefix}`], {cwd: cwd})
  if (!fs.existsSync(resolve(cwd, 'build')))
    run("make", {cwd: cwd})
  if (!fs.existsSync(resolve(prefix, 'bin', 'xmake')))
    run("make", ["install"], {cwd: cwd})
})()
