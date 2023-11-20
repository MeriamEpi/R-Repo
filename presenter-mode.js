<script>
const urlParams = new URLSearchParams(window.location.search);
const presentMe = urlParams.get("presentme");
if (presentMe === "true") {
  alert("Presenter mode is enabled!");
}
</script>