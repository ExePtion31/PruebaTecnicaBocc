const handler = async (event) => {
    let response = 'Célula de ahorros';
    console.debug('Lambda ejecutada correctamente');
    console.error('Fin de ejecución');
    return response;
};

exports.handler = handler;