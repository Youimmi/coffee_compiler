import coffee from 'rollup-plugin-coffee-script'
import commonjs from '@rollup/plugin-commonjs'
import resolve from '@rollup/plugin-node-resolve'
import { terser } from 'rollup-plugin-terser'

const extensions = { extensions: ['.js', '.coffee'] }

export default {
  output: {
    format: 'es'
  },
  plugins: [
    coffee(),
    resolve({ extensions, rootDir: '../assets' }),
    commonjs(extensions),
    terser({ format: { comments: false } })
  ]
}
