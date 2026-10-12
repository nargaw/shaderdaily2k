import glsl from 'vite-plugin-glsl';
import restart from 'vite-plugin-restart'
import { defineConfig } from 'vite';

export default defineConfig({
  oot: 'src/',
  publicDir: '../static/',
  base: './',
  plugins: [
    restart({ restart: [ '../static/**', ] }), // Restart server on static file change
    glsl() // Handle shader files
  ],
});
