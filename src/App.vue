<template>
  <div id="app">
    <Header></Header>
    <router-view></router-view>
    <Footer></Footer>
  </div>
</template>

<script>
import Header from './components/shared/Header';
import Footer from './components/shared/Footer';

export default {
  name: 'app',
  data() {
    return {
    };
  },
  components: {
    Header,
    Footer,
  },
  methods: {

  }
};
</script>

<style type="sass">
  @import "./styles/reset.css"
  @import "./styles/fonts.css"
  .container
    max-width: 1190px
    width: 100%
    margin: 0 auto
</style>
