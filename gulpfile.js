const {series, parallel, src, dest} = require('gulp');
const header = require('gulp-header');
const autoprefix = require("gulp-autoprefixer");
const minifyCSS = require("gulp-csso");
const purgecss = require("gulp-purgecss");
const less = require('gulp-less');
const rename = require("gulp-rename");
const babel = require("gulp-babel");
const uglify = require("gulp-uglify");

//为文件添加头部信息
const pkg = require('./package.json');
const template = ['/**',
    ' * <%= pkg.name %> - <%= pkg.description %>',
    ' * @authors <%= pkg.author %>',
    ' * @version v<%= pkg.version %>',
    ' * @link <%= pkg.homepage %>',
    ' * @license <%= pkg.license %>',
    ' */',
    ''
].join('\n');

function css() {
  return src(['./source/css/less/main.less'])
  .pipe(less())
  .pipe(
    purgecss({//删除无用css样式
      content: ["./**/*.ftl", "./source/libs/**/*.css", "./source/**/*.js"],
    })
  )
  .pipe(
    autoprefix({
      overrideBrowserslist: ["> 2%", "last 2 versions", "not ie 6-9"],
      cascade: false,
    })
  )
  .pipe(minifyCSS())
  .pipe(header(template, { pkg : pkg } ))
  .pipe(
    rename({
      suffix: ".min",
    })
  )
  .pipe(
    rename({
      basename: "style.min",
    })
  )
  .pipe(dest("./source/css/min"));
}

//由于可能对mdui框架内的mdui.css进行更改，所以加入mdui.css的压缩
function mduiCss() {
  return src(["./source/libs/mdui/mdui.css"])
    .pipe(minifyCSS())
    .pipe(
      rename({
        suffix: ".min",
      })
    )
    .pipe(dest("./source/libs/mdui/"));
}

//./source/js/*.js内的js压缩
function js() {
  return src(["./source/js/*.js"])
    .pipe(
      babel({
        presets: [
          [
            "@babel/preset-env",
            {
              targets: "> 2%, last 2 versions, not ie 6-9"
            },
          ],
        ],
      })
    )
    .pipe(uglify())
    .pipe(header(template, { pkg : pkg } ))
    .pipe(
      rename({
        extname: ".min.js",
      })
    )
    .pipe(dest("./source/js/min"));
}


exports.mduiCss = mduiCss;
exports.css = css;
exports.js = js;
//series顺序执行，从左往右，parallel同步执行，所有一起执行
exports.default = series(css,js);