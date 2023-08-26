import BuildBox from './buildBox.mjs';

const roomName = "1000";
const buildBox = new BuildBox(roomName);
const initialLength = 10;
const repeatCount = 4;
const angleToOpen = 30;
const lengthRatio = 0.6;

async function drawThreeBranches(count, branchLength) {
  count -= 1;
  if (count < 0) {
    return;
  }

  // draw branches
  const shortenedBranchLength = branchLength * lengthRatio;
  console.log('push_matrix');
  buildBox.pushMatrix();

  // first branch
  buildBox.clearData();
  buildBox.changeShape('sphere');
  buildBox.setCommand('float');
  buildBox.translate(0, branchLength, 0, angleToOpen, 0, 0);
  buildBox.drawLine(0, 0, 0, 0, shortenedBranchLength, 0, 1, 0, 1);
  await buildBox.sendData();
  await buildBox.sleepSecond(0.5);
  await drawThreeBranches(count, shortenedBranchLength);

  // second branch
  buildBox.clearData();
  buildBox.changeShape('sphere');
  buildBox.setCommand('float');
  buildBox.translate(0, branchLength, 0, angleToOpen, 120, 0);
  buildBox.drawLine(0, 0, 0, 0, shortenedBranchLength, 0, 1, 0, 0);
  await buildBox.sendData();
  await buildBox.sleepSecond(0.5);
  await drawThreeBranches(count, shortenedBranchLength);

  // third branch
  buildBox.clearData();
  buildBox.changeShape('sphere');
  buildBox.setCommand('float');
  buildBox.translate(0, branchLength, 0, angleToOpen, 240, 0);
  buildBox.drawLine(0, 0, 0, 0, shortenedBranchLength, 0, 1, 1, 0);
  await buildBox.sendData();
  await buildBox.sleepSecond(0.5);
  await drawThreeBranches(count, shortenedBranchLength);

  console.log('pop_matrix');
  buildBox.popMatrix();
}

(async () => {
  buildBox.changeShape('sphere');
  buildBox.setCommand('float');
  buildBox.drawLine(0, 0, 0, 0, initialLength, 0, 0, 1, 1);
  await buildBox.sendData();
  await buildBox.sleepSecond(0.5);

  await drawThreeBranches(repeatCount, initialLength);
  console.log('send data done')
})().catch(error => {
  console.error(error);
});
