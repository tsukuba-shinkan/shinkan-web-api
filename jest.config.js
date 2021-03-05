module.exports = {
  roots: ['<rootDir>/tests'],
  testMatch: ['**/*.+(ts|tsx|js)'],
  transform: {
    '^.+\\.(ts|tsx)$': 'ts-jest',
  },
  collectCoverage: true,
  coverageDirectory: './coverage/',
}
