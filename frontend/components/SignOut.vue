<script>
export default {
  created () {
    localStorage.clear();

    this.$router.push('/')
    location.reload();
  }
}
</script>
