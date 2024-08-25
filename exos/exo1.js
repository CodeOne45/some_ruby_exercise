/**
 * Test the code here: https://www.programiz.com/online-compiler/7DMRaFWwN0p9W
 */

function createDistanceMatrix(keypad) {
  if (keypad.length !== 9) {
    throw new Error("error: The keypad must contain 9 unique digits.");
  }
  const uniqueDigits = new Set(keypad);

  if (uniqueDigits.size !== 9 || ![...uniqueDigits].every(digit => digit >= '1' && digit <= '9')) {
    throw new Error("error: The keypad must contain 9 unique digits.");
  }

  const matrix = {};

  for (let i = 0; i < 9; i++) {
    const digit1 = keypad[i];
    const row1 = Math.floor(i / 3);
    const col1 = i % 3;

    matrix[digit1] = {};

    for (let j = 0; j < 9; j++) {
      const digit2 = keypad[j];
      const row2 = Math.floor(j / 3);
      const col2 = j % 3;

      // Based on Chebyshev distance, wiki: https://en.wikipedia.org/wiki/Chebyshev_distance
      matrix[digit1][digit2] = Math.max(
        Math.abs(row1 - row2),
        Math.abs(col1 - col2)
      );
    }
  }

  return matrix;
}

function entryTime(s, keypad) {
  if (s.length < 1 || s.length > 100000) {
    throw new Error("error: The length of s must be between 1 and 10^5.");
  }

  const distanceMatrix = createDistanceMatrix(keypad);
  let totalTime = 0;

  for (let i = 1; i < s.length; i++) {
    totalTime += distanceMatrix[s[i - 1]][s[i]];
  }

  return totalTime;
}

// Test cases

console.log(entryTime("423692", "923857614")); // --> should output 8 (Check the explanation in exercise description)
