import coffee from 'rollup-plugin-coffee-script'
import commonjs from '@rollup/plugin-commonjs'
import compiler from '@ampproject/rollup-plugin-closure-compiler';
import resolve from '@rollup/plugin-node-resolve'
import { terser } from 'rollup-plugin-terser'

const extensions = { extensions: ['.js', '.coffee'] }

export default ({ configRootDir }) => ({
  output: { format: 'es' },
  plugins: [
    coffee(),
    resolve({ extensions, rootDir: configRootDir }),
    commonjs(extensions),
    terser({ format: { comments: false } }),
    compiler()
  ]
})
