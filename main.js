const { app, BrowserWindow, Menu } = require('electron');
const path = require('path');
function createWindow() {
  const win = new BrowserWindow({ width: 1300, height: 850, title: 'لوحة التحقيق', backgroundColor: '#1b1b1d' });
  Menu.setApplicationMenu(null);
  win.loadFile(path.join(__dirname, 'index.html'));
  win.webContents.on('console-message', (e, level, msg, line) => { if (level >= 2) console.log('ERR:', msg, line); });
}
app.whenReady().then(createWindow);
app.on('window-all-closed', () => app.quit());
