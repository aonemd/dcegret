<template>
  <div>
    <div class="scrollable">
      <div v-for="message in messages">
        <div class="row">
          <div class="col-4 col-m-6 center">
            <span>
              {{ message.username }}: {{ message.body }}
            </span>
          </div>
        </div>
      </div>
    </div>

    <div class="row">
      <div class="col-4 col-m-6 center text-center">
        <hr>
        <textarea
          id="post__editor"
          v-model='messageBody'
          cols="50"
          rows='3'
          placeholder="Send a message...">
        </textarea>
        <input type="button" v-on:click="sendNewMessage" class="message-submit__button" value="Send">
      </div>
    </div>
  </div>
</template>

<script>
import api from '../services/api/messages.js';

export default {
  data() {
    return {
      messages: [],
      messageBody: '',
      recipient_id: this.$route.params.id
    }
  },
  created() {
    api.show(this.recipient_id, this.$store.getters.current_account_token).
      then((response) => this.messages = response.data.conversation.messages);
  },
  methods: {
    sendNewMessage: function() {
      api.create(this.messageBody, this.recipient_id, this.$store.getters.current_account_token).
        then((response) => {
          this.messages.push({
            username: this.$store.getters.current_account_username,
            body: this.messageBody
          })

          var container       = this.$el.querySelector(".scrollable");
          container.scrollTop = container.scrollHeight;

          this.messageBody = '';
        });
    }
  }
}
</script>

<style lang="scss" scoped>
$primary-color: #407ee7;

.message-submit__button {
  width: 20%;
  background: none;
  border: 2px solid $primary-color;
  color: white;
  padding: 5px;
  font-size: 18px;
  cursor: pointer;
  margin: 12px 0;
  cursor: pointer;
  float: right;
}

span {
  color: white;
}

.scrollable {
  max-height: 400px;
  overflow-y: auto;
}
</style>
