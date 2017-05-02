class HanoiView {
  constructor (game, $el) {
    this.game = game;
    this.$el = $el;
    this.setupTowers();
    this.clickTower();
  }

  setupTowers () {
    this.render();
  }

  render() {
    for (var rowIdx = 0; rowIdx < 3; rowIdx++) {
      const $row = $('<ul>').addClass("group");
      for (var colIdx = 2; colIdx >= 0; colIdx--) {
        const $col = $('<li>').attr('idx', [rowIdx, colIdx]);
        if (this.game.towers[rowIdx][colIdx] === 1) {
          $col.addClass("stack1");
        } else if (this.game.towers[rowIdx][colIdx] === 2) {
          $col.addClass("stack2");
        } else if (this.game.towers[rowIdx][colIdx] === 3) {
          $col.addClass("stack3");
        }
        $row.append($col);
        console.log($row);

      }
      this.$el.append($row);
    }

  }

  clickTower () {
    $("li").on("click", (event) => {
      let target = event.currentTarget;
      let startTowerIdx = $(target).attr("idx").split(",").map((el) => parseInt(el))[0];
      console.log(target);
      let endTowerIdx = undefined;
      $("li").on("click", (event2) => {
        target = event2.currentTarget;
        endTowerIdx = $(target).attr("idx").split(",").map((el) => {parseInt(el)})[0];
      });
      this.game.move(startTowerIdx, endTowerIdx);

    });
    this.render();
  }

}


module.exports = HanoiView;
