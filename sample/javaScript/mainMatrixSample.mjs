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
  vox.pushMatrix();

  // first branch
  vox.transform(0, branchLength, 0, angleToOpen, 0, 0);
  vox.drawLine(0, 0, 0, 0, shortenedBranchLength, 0, 1, 0, 1);
  await drawThreeBranches(count, shortenedBranchLength);

  // second branch
  vox.transform(0, branchLength, 0, angleToOpen, 120, 0);
  vox.drawLine(0, 0, 0, 0, shortenedBranchLength, 0, 1, 0, 0);
  await drawThreeBranches(count, shortenedBranchLength);

  // third branch
  vox.transform(0, branchLength, 0, angleToOpen, 240, 0);
  vox.drawLine(0, 0, 0, 0, shortenedBranchLength, 0, 1, 1, 0);
  await drawThreeBranches(count, shortenedBranchLength);

  console.log('pop_matrix');
  vox.popMatrix();
}

const roomName = "1000";
const vox = new Voxelamming(roomName);
vox.setBoxSize(0.5);
vox.changeShape('sphere');
vox.setCommand('float');
vox.drawLine(0, 0, 0, 0, initialLength, 0, 0, 1, 1);

await drawThreeBranches(repeatCount, initialLength);
await vox.sendData();
console.log('send data done');
