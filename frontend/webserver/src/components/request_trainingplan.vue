<template>
  <div class="contentdiv">
    <h1>Trainingsplanantrag</h1>
      <table>
      <tr>
        <td>Datum:</td><td><input type="date" v-model="date"></td>
      </tr>
    </table>
    <button id="conf" v-on:click="confirm">Bestätigen</button>
  </div>
</template>

<script>
import api_config from '../../config/api_config'
import router from '../router'
import firebase from 'firebase'
import firebase_config from '../../config/firebase_config'

export default {
  name: "RequestTrainingplan",
  data() {
    return {date: null}
  },
  methods: {
    confirm: function (event) {
      var id = ""
      if (firebase.auth().currentUser != null) {
        id = firebase.auth().currentUser.uid
      }
      // add validation
      if (this.date != null) {
        fetch(api_config.url.concat("/requests/trainingplan"), {
          method: "POST",
          body: JSON.stringify({id: id, date: this.date})
        }).then(res => {
          alert('Antrag erfolgreich abgeschickt')
            // `event` is the native DOM event
        })
      } else {
          alert('Datum eingeben!')
      }
      if (event && this.date != null) {
        router.push('/profile')
      }
    }
  }
}
</script>

<style scoped>
table {
  border-collapse: collapse;
  width: 100%;
  margin-top: 20px;
}
td {
  width: 50%;
  border-width: 2px;
}
tr {
  padding-top: 8px;
  padding-bottom: 8px;
}
#conf {
    float: right;
}
input {
    width: 96%;
}
</style>