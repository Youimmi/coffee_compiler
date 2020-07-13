import coffee from 'rollup-plugin-coffee-script'
import commonjs from '@rollup/plugin-commonjs'
import resolve from '@rollup/plugin-node-resolve'
import { terser } from 'rollup-plugin-terser'

export default {
  output: {
    format: 'es'
  },
  plugins: [
    coffee({ bare: true }),
    resolve(),
    commonjs(),
    terser()
  ]
}
