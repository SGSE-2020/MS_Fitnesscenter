<template>
  <div class="contentdiv">
    <h1>Mitglied einfügen</h1>
    <table>
      <tr>
        <td>UserID:</td>
        <td><input v-model="uuid" placeholder="UUID"> </td>
      </tr>
      <tr>
        <td>Rolle:</td>
        <td>
          <select v-model="role">
            <option value="" selected disabled>Please select one</option>
            <option value="0">Kunde</option>
            <option value="1">Trainer</option>
            <option value="2">Physiotherapeut</option>
          </select>
        </td>
      </tr>
      <tr>
        <td>Abo:</td>
        <td>
          <select v-model="abo">
            <option value="" selected disabled>Please select one</option>
            <option v-for="single_abo in all_abos" :key="single_abo.id" :value="single_abo.id">{{ single_abo.name }}</option>
          </select>
        </td>
      </tr>
      <tr>
        <td>Startdatum</td>
        <td><input type="date" v-model="date"></td>
      </tr>
    </table>
    <button id="conf" v-on:click="confirm">Bestätigen</button>
  </div>
</template>

<script>
import api_config from '../../config/api_config'
import router from '../router'

export default {
  name: 'AddMember',
  data() {
    return {
      uuid: null,
      role: null,
      abo: null,
      all_abos: [],
      date: null
    }
  },
  created() {
    fetch(api_config.url.concat("/abo"))
      .then(response => response.json())
      .then(json => {
        this.all_abos = json
        console.log(this.all_abos)
      })
  },
  methods: {
    confirm: function (event) {
      // add validation
      console.log(event)
      if (this.uuid != null && this.role != null) {
        console.log(JSON.stringify({uid: this.uuid, role: this.role, abo_id: this.abo, abo_start: this.date}))
        fetch(api_config.url.concat("/members/add"), {
          method: "POST",
          body: JSON.stringify({uid: this.uuid, role: this.role, abo_id: this.abo, abo_start: this.date})
        }).then(res => res.json()).then(data => {
          alert('Antrag erfolgreich abgeschickt: ' + data.message)
          router.push('/members')
            // `event` is the native DOM event
        }).catch((error) => {
          console.error(error)
          alert('Ein Problem ist aufgetreten')
        })
      } else {
          alert('Datum, UUID, Rolle eingeben!')
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
    padding-bottom: 16px;
}
input {
    width: 96%;
}
select {
    width: 100%;
}
#conf {
    float: right;
}
</style>