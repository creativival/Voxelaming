// import { Voxelamming } from 'voxelamming';
import Voxelamming from './voxelamming.js';  // test

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
  voxelamming.pushMatrix();

  // first branch
  voxelamming.transform(0, branchLength, 0, angleToOpen, 0, 0);
  voxelamming.drawLine(0, 0, 0, 0, shortenedBranchLength, 0, 1, 0, 1);
  await drawThreeBranches(count, shortenedBranchLength);

  // second branch
  voxelamming.transform(0, branchLength, 0, angleToOpen, 120, 0);
  voxelamming.drawLine(0, 0, 0, 0, shortenedBranchLength, 0, 1, 0, 0);
  await drawThreeBranches(count, shortenedBranchLength);

  // third branch
  voxelamming.transform(0, branchLength, 0, angleToOpen, 240, 0);
  voxelamming.drawLine(0, 0, 0, 0, shortenedBranchLength, 0, 1, 1, 0);
  await drawThreeBranches(count, shortenedBranchLength);

  console.log('pop_matrix');
  voxelamming.popMatrix();
}

const roomName = "1000";
const voxelamming = new Voxelamming(roomName);
voxelamming.setBoxSize(0.5);
voxelamming.changeShape('sphere');
voxelamming.setCommand('float');
voxelamming.drawLine(0, 0, 0, 0, initialLength, 0, 0, 1, 1);

await drawThreeBranches(repeatCount, initialLength);
await voxelamming.sendData();
console.log('send data done');
