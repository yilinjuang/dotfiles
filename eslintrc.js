module.exports = {
    'env': {
        'browser': true,
        'es6': true,
        'node': true,
        "webextensions": true,
    },
    'extends': ['eslint:recommended'],  // Use default rules.
    // 'extends': ['eslint:recommended', 'google'],  // Use Google coding styles.
    'parserOptions': {
        "ecmaVersion": 2017,
        'sourceType': 'module',
    },
    'rules': {
        "indent": [
            "error",
            4
        ],
        'no-console': 'off',
        'require-jsdoc': 'off',
        "semi": [
            "error",
            "always",
        ],
    },
}
