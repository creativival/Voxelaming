class Turtle {
  constructor(voxelamming) {
    this.voxelamming = voxelamming;
    this.x = 0;
    this.y = 0;
    this.z = 0;
    this.polarTheta = 90;
    this.polarPhi = 0;
    this.drawable = true;
    this.color = [0, 0, 0, 1];
  }

  forward(length) {
    let z = this.z + length * Math.sin(this.degToRad(this.polarTheta)) * Math.cos(this.degToRad(this.polarPhi));
    let x = this.x + length * Math.sin(this.degToRad(this.polarTheta)) * Math.sin(this.degToRad(this.polarPhi));
    let y = this.y + length * Math.cos(this.degToRad(this.polarTheta));

    x = this.roundToThreeDecimalPlaces(x);
    y = this.roundToThreeDecimalPlaces(y);
    z = this.roundToThreeDecimalPlaces(z);

    if (this.drawable) {
      this.voxelamming.drawLine(this.x, this.y, this.z, x, y, z, ...this.color);
    }

    this.x = x;
    this.y = y;
    this.z = z;
  }

  backward(length) {
    this.forward(-length);
  }

  up(degree) {
    this.polarTheta -= degree;
  }

  down(degree) {
    this.polarTheta += degree;
  }

  right(degree) {
    this.polarPhi -= degree;
  }

  left(degree) {
    this.polarPhi += degree;
  }

  setColor(r, g, b, alpha = 1) {
    this.color = [r, g, b, alpha];
  }

  penDown() {
    this.drawable = true;
  }

  penUp() {
    this.drawable = false;
  }

  setPos(x, y, z) {
    this.x = x;
    this.y = y;
    this.z = z;
  }

  reset() {
    this.x = 0;
    this.y = 0;
    this.z = 0;
    this.polarTheta = 90;
    this.polarPhi = 0;
    this.drawable = true;
    this.color = [0, 0, 0, 1];
  }

  degToRad(degrees) {
    return degrees * (Math.PI / 180);
  }

  roundToThreeDecimalPlaces(num) {
    return Math.round(num * 1000) / 1000;
  }
}

export default Turtle;
