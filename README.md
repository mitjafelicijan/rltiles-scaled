# Scaled RLTiles

This repository contains resized tilest from
[Crawl](https://github.com/crawl/crawl).

All images are generated from original `32x32` directory.

Current variations:

- [32x32](./32x32)
- [64x64](./64x64)
- [128x128](./128x128)
- [256x256](./256x256)
- [512x512](./512x512)
- [1024x1024](./1024x1024)

## Scaling

Under the hood all images are resized with:

- [GNU Bash](https://www.gnu.org/software/bash/)
- [GNU Parallel](https://www.gnu.org/software/parallel/)
- [ImageMagick](https://imagemagick.org/)

```sh
bash resize.sh
```

## License

Part of (or All) the graphic tiles used in this program is the public domain
roguelike tileset "RLTiles". You can find the original tileset at:
<http://rltiles.sf.net>

[Crawl](https://github.com/crawl/crawl) is licensed as GPLv2.
