module.exports = {
  roots: ['<rootDir>'],
  testMatch: ['<rootDir>/tests/**/*.+(ts|tsx|js)'],
  transform: {
    '^.+\\.(ts|tsx)$': 'ts-jest',
  },
  collectCoverage: true,
  coverageDirectory: './coverage/',
}
