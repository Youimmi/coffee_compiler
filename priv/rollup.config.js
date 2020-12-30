import coffee from 'rollup-plugin-coffee-script'
import commonjs from '@rollup/plugin-commonjs'
import resolve from '@rollup/plugin-node-resolve'

const extensions = { extensions: ['.js', '.coffee'] }

export default {
  output: {
    format: 'es'
  },
  plugins: [
    coffee(),
    resolve(extensions),
    commonjs(extensions)
  ]
}
