#!/usr/bin/env node
const os = require('os');
const fs = require('fs');
const path = require('path');

function copyDirectory(src, dest) {
  fs.mkdirSync(dest, {recursive: true});

  const entries = fs.readdirSync(src, {withFileTypes: true});

  for (const entry of entries) {
    const srcPath = path.join(src, entry.name);
    const destPath = path.join(dest, entry.name);

    if (entry.isDirectory()) {
      copyDirectory(srcPath, destPath);
    } else {
      fs.copyFileSync(srcPath, destPath);
    }
  }
}

const sourceDir = 'usr';
const destinationDir = `prebuilds/xmake-${os.platform()}-${os.arch()}`;

copyDirectory(sourceDir, destinationDir);
