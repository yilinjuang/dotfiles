module.exports = {
    'env': {
        'browser': true,
        'es6': true,
        'node': true,
    },
    // 'extends': ['eslint:recommended'],  // Use default rules.
    'extends': ['eslint:recommended', 'google'],  // Use Google coding styles.
    'parserOptions': {
        'ecmaFeatures': {
            'impliedStrict': true,
        },
        'sourceType': 'module',
    },
    'rules': {
        'no-console': 'off',
        'require-jsdoc': 'off',
        // 'indent': ['error', 2]  // Set indent to 2 spaces.
    },
}
