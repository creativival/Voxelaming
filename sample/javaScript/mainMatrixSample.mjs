import { BuildBox } from 'voxelamming';
// import BuildBox from './buildBox.js';  // test

const initialLength = 10;
const repeatCount = 5;
const angleToOpen = 30;
const lengthRatio = 0.8;

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
  buildBox.transform(0, branchLength, 0, angleToOpen, 0, 0);
  buildBox.drawLine(0, 0, 0, 0, shortenedBranchLength, 0, 1, 0, 1);
  await drawThreeBranches(count, shortenedBranchLength);

  // second branch
  buildBox.transform(0, branchLength, 0, angleToOpen, 120, 0);
  buildBox.drawLine(0, 0, 0, 0, shortenedBranchLength, 0, 1, 0, 0);
  await drawThreeBranches(count, shortenedBranchLength);

  // third branch
  buildBox.transform(0, branchLength, 0, angleToOpen, 240, 0);
  buildBox.drawLine(0, 0, 0, 0, shortenedBranchLength, 0, 1, 1, 0);
  await drawThreeBranches(count, shortenedBranchLength);

  console.log('pop_matrix');
  buildBox.popMatrix();
}

const roomName = "1000";
const buildBox = new BuildBox(roomName);
buildBox.setBoxSize(0.5);
buildBox.changeShape('sphere');
buildBox.setCommand('float');
buildBox.drawLine(0, 0, 0, 0, initialLength, 0, 0, 1, 1);

await drawThreeBranches(repeatCount, initialLength);
await buildBox.sendData();
console.log('send data done');
