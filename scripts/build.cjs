#!/usr/bin/env node
const { resolve } = require('node:path');
const { spawnSync } = require('node:child_process');
const os = require('node:os');

const prefix = resolve(__dirname, '..', 'prebuilds', `xmake-${os.platform()}-${os.arch()}`);

function run(...args) {
  console.log([args[0], ...args[1]].join(' '))
  const cmd = spawnSync(...args);
  console.log(cmd.stdout.toString());
  console.error(cmd.stderr.toString());
}

(async () => {
    run('xmake', ['build', '-y', '-P', '.'], { cwd: __dirname });
    run('xmake', ['install', '-y', '-P', '.', '-o', prefix], { cwd: __dirname });
})();
