import coffee from 'rollup-plugin-coffee-script'
import commonjs from '@rollup/plugin-commonjs'
import resolve from '@rollup/plugin-node-resolve'
import { terser } from 'rollup-plugin-terser'

export default {
  input: '../../Mia/assets/javascripts/app.coffee',
  output: {
    format: 'es'
  },
  plugins: [
    coffee({ bare: true }),
    resolve(),
    commonjs({
      namedExports: {
        '../../Mia/assets/node_modules/phoenix_live_view': ['LiveSocket'],
        '../../Mia/assets/node_modules/phoenix': ['Socket']
      }
    }),
    terser()
  ]
}
