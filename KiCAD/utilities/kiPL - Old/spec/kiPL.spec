# -*- mode: python -*-

block_cipher = None


a = Analysis(['C:/Users/DGilliland/Documents/GitHub/lb-boards/KiCAD/utilities/kiPL/src/kiPL.py'],
             pathex=['C:/Users/DGilliland/Documents/GitHub/lb-boards/KiCAD/utilities/kiPL/spec'],
             binaries=[],
             datas=[],
             hiddenimports=[],
             hookspath=[],
             runtime_hooks=[],
             excludes=[],
             win_no_prefer_redirects=False,
             win_private_assemblies=False,
             cipher=block_cipher)
pyz = PYZ(a.pure, a.zipped_data,
             cipher=block_cipher)
exe = EXE(pyz,
          a.scripts,
          a.binaries,
          a.zipfiles,
          a.datas,
          name='kiPL',
          debug=False,
          strip=False,
          upx=True,
          console=True )
