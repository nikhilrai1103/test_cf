component {

  this.name = "My Awesome App";
  this.sessionStorage = true;
  this.sessionmanagement = "Yes"

  this.sessionTimeout = createTimeSpan(0, 2, 0, 0); // 2 hours

  function onSessionStart() {
    writeDump("on session start");
  }
  function onSessionEnd(struct sessionScope, struct applicationScope) {
    writeDump("on session end");
  }
}
