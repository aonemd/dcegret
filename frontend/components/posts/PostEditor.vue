<template>
  <div>
    <textarea
      id="post__editor"
      v-model='taValue'
      cols="200"
      :rows='rows'
      @input='$emit("input", taValue)'
      placeholder="Chirp something...">
    </textarea>

    <label
      id="post__editor-header"
      :class="[{'post___over-max': isOverMax}, 'text-left']"
      for="post__editor">
      {{ remaining }} characters left
    </label>
  </div>
</template>

<script>
export default {
  props: ["maxCharacters", "rows", "value"],
  data(){
    return {
      taValue: this.value
    }
  },
  computed:{
    isOverMax(){
      if (!this.taValue)
        return false;

      return (this.maxCharacters - this.taValue.length) < 0;
    },
    remaining(){
      if (!this.taValue)
        return this.maxCharacters;

      return this.maxCharacters - this.taValue.length
    }
  }
}
</script>

<style scoped>
textarea {
  display: block;
  resize: none;
  outline: none;
  width: 100%;
  padding: 15px;
}

#post__editor-header {
  display: block;
  width: 100%;
  padding-right: 10px;
  color: white;
  background-color: #211f1f;
  font-size: 18px;
}

.post___over-max {
  color: #f22c40 !important;
}
</style>
