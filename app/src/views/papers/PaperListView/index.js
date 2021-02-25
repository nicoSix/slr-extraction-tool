import React, { useState, useEffect } from 'react';
import {
  Box,
  Container,
  makeStyles
} from '@material-ui/core';
import Page from 'src/components/Page';
import MessageSnackbar from 'src/components/MessageSnackbar';
import APIRequestMethods from 'src/utils/APIRequest';
import handleErrorRequest from 'src/utils/handleErrorRequest';
import Results from './Results';
import Toolbar from './Toolbar';
import PaperModal from './PaperModal';
import ArchitectureModal from './ArchitectureModal';

const useStyles = makeStyles((theme) => ({
  root: {
    backgroundColor: theme.palette.background.dark,
    minHeight: '100%',
    paddingBottom: theme.spacing(3),
    paddingTop: theme.spacing(3)
  }
}));

const PapersListView = () => {
  const classes = useStyles();
  const [papers, setPapers] = useState([]);
  const [displayedPapers, setDisplayedPapers] = useState([]);
  const [titleFilter, setTitleFilter] = useState('');

  const [paperModalProps, setPaperModalProps] = useState({
    open: false,
    paper: {},
    actionType: ''
  });

  const [architectureModalProps, setArchitectureModalProps] = useState({
    open: false,
    architecture: {},
    actionType: ''
  });

  const [messageSnackbarProps, setMessageSnackbarProps] = useState({
    open: false,
    message: '',
    duration: 0,
    severity: 'information'
  });

  const displayMsg = (message, severity = 'success', duration = 6000) => {
    setMessageSnackbarProps({
      open: true,
      severity,
      duration,
      message
    });
  };

  const removePaperFromState = (paperId) => {
    let i;
    const newPapers = [...papers];
    for (i = 0; i < newPapers.length; i++) {
      if (newPapers[i].id === paperId) {
        newPapers.splice(i, 1);
        setPapers(newPapers);
        return true;
      }
    }

    return false;
  };

  const removeArchitectureFromState = (paperId, architectureId) => {
    let i; let j;
    const newPapers = [...papers];
    for (i = 0; i < newPapers.length; i++) {
      if (newPapers[i].id === paperId) {
        for (j = 0; j < newPapers[i].architectures.length; j++) {
          if (newPapers[i].architectures[j].id === architectureId) {
            newPapers[i].architectures.splice(j, 1);
            setPapers(newPapers);
            return true;
          }
        }
      }
    }

    return false;
  };

  const modifyPaperFromState = (newPaper) => {
    let i;
    const newPapers = [...papers];
    for (i = 0; i < newPapers.length; i++) {
      if (newPapers[i].id === newPaper.id) {
        newPapers[i] = newPaper;
        setPapers(newPapers);
        return true;
      }
    }

    return false;
  };

  const addArchitectureToState = (newArchitecture) => {
    let i;
    const newPapers = [...papers];
    for (i = 0; i < newPapers.length; i++) {
      if (newPapers[i].id === newArchitecture.paper_id) {
        newPapers[i].architectures.push(newArchitecture);
        setPapers(newPapers);
        return true;
      }
    }

    return false;
  };

  const modifyArchitectureFromState = (newArchitecture) => {
    let i; let j;
    const newPapers = [...papers];
    for (i = 0; i < newPapers.length; i++) {
      if (newPapers[i].id === newArchitecture.paper_id) {
        for (j = 0; j < newPapers[i].architectures.length; j++) {
          if (newPapers[i].architectures[j].id === newArchitecture.id) {
            newPapers[i].architectures[j] = newArchitecture;
            setPapers(newPapers);
            return true;
          }
        }
      }
    }

    return false;
  };

  const deletePaper = (paperId) => {
    APIRequestMethods.deletePaper(paperId)
      .then(({ data }) => {
        if (data.success) {
          removePaperFromState(paperId);
          if (paperModalProps.open) {
            setPaperModalProps({
              open: false,
              paper: {},
              actionType: ''
            });
          }
          displayMsg('Paper successfully deleted.');
        }
      })
      .catch((error) => handleErrorRequest(error, displayMsg));
  };

  const deleteArchitecture = (paperId, architectureId) => {
    APIRequestMethods.deleteArchitecture(architectureId)
      .then(({ data }) => {
        if (data.success) {
          removeArchitectureFromState(paperId, architectureId);
          if (setArchitectureModalProps.open) {
            setArchitectureModalProps({
              open: false,
              architecture: {},
              actionType: ''
            });
          }
          displayMsg('Architecture successfully deleted.');
        }
      })
      .catch((error) => handleErrorRequest(error, displayMsg));
  };

  const saveNewPaper = (newPaper) => {
    APIRequestMethods.saveNewPaper(newPaper)
      .then(({ data }) => {
        if (data.success) {
          setPapers([
            ...papers,
            {
              ...newPaper,
              id: data.paperId,
              status: 0,
              architectures: []
            }
          ]);
          setPaperModalProps({
            open: false,
            paper: {},
            actionType: ''
          });
          displayMsg('Paper successfully added.');
        }
      })
      .catch((error) => handleErrorRequest(error, displayMsg));
  };

  const saveNewArchitecture = (newArchitecture) => {
    APIRequestMethods.saveNewArchitecture(newArchitecture)
      .then(({ data }) => {
        if (data.success) {
          addArchitectureToState({ ...newArchitecture, id: data.architectureId });
          setArchitectureModalProps({
            open: false,
            architecture: {},
            actionType: ''
          });
          displayMsg('Architecture successfully added.');
        }
      })
      .catch((error) => handleErrorRequest(error, displayMsg));
  };

  const saveExistingPaper = (newPaper) => {
    APIRequestMethods.saveExistingPaper(newPaper)
      .then(({ data }) => {
        if (data.success) {
          modifyPaperFromState(newPaper);
          setPaperModalProps({
            open: false,
            paper: {},
            actionType: ''
          });
          displayMsg('Paper successfully modified.');
        }
      })
      .catch((error) => handleErrorRequest(error, displayMsg));
  };

  const saveExistingArchitecture = (newArchitecture) => {
    APIRequestMethods.saveExistingArchitecture(newArchitecture)
      .then(({ data }) => {
        if (data.success) {
          modifyArchitectureFromState(newArchitecture);
          setArchitectureModalProps({
            open: false,
            architecture: {},
            actionType: ''
          });
          displayMsg('Architecture successfully modified.');
        }
      })
      .catch((error) => handleErrorRequest(error, displayMsg));
  };

  const fillDisplayedPapers = () => {
    if (!titleFilter.length) setDisplayedPapers(papers);
    else {
      const newDisplayedPapers = [];

      papers.forEach((paper) => {
        if (paper.name.includes(titleFilter)) {
          newDisplayedPapers.push(paper);
        }
      });

      setDisplayedPapers(newDisplayedPapers);
    }
  };

  const paperActionHandler = (actionType, paper) => {
    switch (actionType) {
      case 'new':
        setPaperModalProps({
          open: true,
          actionType,
          paper: {}
        });
        break;
      case 'edit':
      case 'view':
        if (paper) {
          setPaperModalProps({
            open: true,
            actionType,
            paper
          });
        }
        break;

      case 'delete':
        // Can be replaced with a prettier modal later.
        if (window.confirm('Paper deletion is irreversible. Associated architectures, components, and properties will also be deleted. Proceed?')) deletePaper(paper.id);
        break;

      default:
        console.error('No action were provided to the handler.');
    }
  };

  const architectureActionHandler = (actionType, architecture) => {
    switch (actionType) {
      case 'new':
        setArchitectureModalProps({
          open: true,
          actionType,
          architecture: { paper_id: architecture.paper_id }
        });
        break;
      case 'edit':
      case 'view':
        setArchitectureModalProps({
          open: true,
          actionType,
          architecture
        });
        break;

      case 'delete':
        // Can be replaced with a prettier modal later.
        if (window.confirm('Architecture deletion is irreversible. Associated components and properties will also be deleted. Proceed?')) deleteArchitecture(architecture.paper_id, architecture.id);
        break;

      default:
        console.error('No action were provided to the handler.');
    }
  };

  const paperActionModalHandler = (actionType, newPaper) => {
    switch (actionType) {
      case 'delete':
        if (window.confirm('Paper deletion is irreversible. Associated architectures, components, and properties will also be deleted. Proceed?')) deletePaper(paperModalProps.paper.id);
        break;

      case 'new':
        saveNewPaper({
          ...newPaper,
          added_by: localStorage.getItem('username')
        });
        break;

      case 'edit':
        saveExistingPaper(newPaper);
        break;

      default:
        console.error('No action were provided to the handler.');
    }
  };

  const architectureActionModalHandler = (actionType, newArchitecture) => {
    switch (actionType) {
      case 'delete':
        if (window.confirm('Architecture deletion is irreversible. Associated components and properties will also be deleted. Proceed?')) { deleteArchitecture(architectureModalProps.architecture.paper_id, architectureModalProps.architecture.id); }
        break;

      case 'new':
        saveNewArchitecture(newArchitecture);
        break;

      case 'edit':
        saveExistingArchitecture(newArchitecture);
        break;

      default:
        console.error('No action were provided to the handler.');
    }
  };

  const getPapers = () => {
    APIRequestMethods.getPapers()
      .then(({ data }) => {
        if (data.success) {
          setPapers(data.result);
        }
      })
      .catch((error) => handleErrorRequest(error, displayMsg));
  };

  useEffect(() => {
    getPapers();
  }, []);

  useEffect(() => {
    fillDisplayedPapers();
  }, [titleFilter, papers]);

  return (
    <Page
      className={classes.root}
      title="Papers"
    >
      <Container maxWidth={false}>
        <Toolbar
          setTitleFilter={setTitleFilter}
          actionHandler={paperActionHandler}
          papers={papers}
        />
        <Box mt={3}>
          <Results
            papers={displayedPapers}
            paperActionHandler={paperActionHandler}
            architectureActionHandler={architectureActionHandler}
          />
        </Box>
      </Container>
      <PaperModal
        modalProps={paperModalProps}
        setModalProps={setPaperModalProps}
        actionModalHandler={paperActionModalHandler}
      />
      <ArchitectureModal
        modalProps={architectureModalProps}
        setModalProps={setArchitectureModalProps}
        actionModalHandler={architectureActionModalHandler}
      />
      <MessageSnackbar
        messageSnackbarProps={messageSnackbarProps}
        setMessageSnackbarProps={setMessageSnackbarProps}
      />
    </Page>
  );
};

export default PapersListView;