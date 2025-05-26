#!/usr/bin/env node
const { resolve } = require('node:path');
const { spawnSync } = require('node:child_process');
const os = require('node:os');

const wd = resolve(__dirname, '..');
const cwd = resolve(wd, 'assets');
const prefix = resolve(wd, 'prebuilds', `xmake-${os.platform()}-${os.arch()}`);

function run(...args) {
  const cmd = spawnSync(...args);
  console.log(cmd.stdout.toString());
  console.error(cmd.stderr.toString());
}

(async () => {
    run('xmake', ['build', '-y'], { cwd: cwd });
    run('xmake', ['install', '-y', '-o', prefix], { cwd: cwd });
})();
